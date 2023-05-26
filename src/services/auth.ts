import { PrismaClient, User } from "@prisma/client";
import bcrypt from "bcrypt";
import { sign } from "jsonwebtoken";

const prisma = new PrismaClient();

export async function register(email: string, password: string) {
  const user = await prisma.user.create({
    data: {
      email,
      password: await bcrypt.hash(password, 8),
    },
  });

  return createToken(user);
}

export const findById = async (id: string) =>
  prisma.user.findUnique({
    where: { id },
  });

export async function attemptLogin(email: string, password: string) {
  const user = await prisma.user.findFirst({
    where: {
      email,
      deleted: false,
    },
  });

  const match = user && (await bcrypt.compare(password, user.password));

  if (!user || !match) {
    throw new Error("Bad credentials");
  }

  return createToken(user);
}

function createToken(user: User): string {
  const token = sign(
    {
      exp: Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 180,
      email: user.email,
      user_id: user.id,
    },
    "VerySecretKeyToSignMyLogin"
  );

  return token;
}
