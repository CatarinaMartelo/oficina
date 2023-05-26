import { PrismaClient, Item_Reparacao } from "@prisma/client";

export const prisma = new PrismaClient();

const all = () =>
  prisma.item_Reparacao.findMany({
    where: {
      deleted: false,
    },
  });

const detail = (id: string) =>
  prisma.item_Reparacao.findFirst({
    where: {
      id,
      deleted: false,
    },
  });

const add = (nome: string, preco: number) =>
  prisma.item_Reparacao.create({
    data: {
      nome,
      preco,
    },
  });

const update = (id: string, item: Item_Reparacao) =>
  prisma.item_Reparacao.update({
    where: { id },
    data: item,
  });

const remove = (id: string) =>
  prisma.item_Reparacao.update({
    where: { id },
    data: {
      deleted: true,
    },
  });

export { all, detail, add, update, remove };
