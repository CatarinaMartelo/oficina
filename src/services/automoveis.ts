import { PrismaClient, Automovel } from "@prisma/client";

export const prisma = new PrismaClient();

const all = () =>
  prisma.automovel.findMany({
    where: {
      deleted: false,
    },
  });

const detail = (id: string) =>
  prisma.automovel.findFirst({
    where: {
      id,
      deleted: false,
    },
  });

const add = (
  matricula: string,
  marca: string,
  modelo: string,
  cor: string,
  observacoes?: string
) =>
  prisma.automovel.create({
    data: {
      matricula,
      marca,
      modelo,
      cor,
      observacoes,
    },
  });

const update = (id: string, automovel: Automovel) =>
  prisma.automovel.update({
    where: { id },
    data: automovel,
  });

const remove = (id: string) =>
  prisma.automovel.update({
    where: { id },
    data: {
      deleted: true,
    },
  });

export { all, detail, add, update, remove };
