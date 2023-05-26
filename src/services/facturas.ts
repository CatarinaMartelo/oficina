import { PrismaClient, Factura, Item_Reparacao } from "@prisma/client";

export const prisma = new PrismaClient();

const all = () =>
  prisma.factura.findMany({
    where: {
      deleted: false,
    },
    include: {
      items: true,
    },
  });

const detail = (id: string) =>
  prisma.factura.findFirst({
    where: {
      id,
      deleted: false,
    },
    include: {
      items: true,
    },
  });

const add = (
  numero_ft: string,
  preco_total: number,
  automovelId: string,
  itemIds: string[],
  metodo_pagamento: string,
  vat_number?: string
) =>
  prisma.factura.create({
    data: {
      numero_ft,
      preco_total,
      automovel: {
        connect: {
          id: automovelId,
        },
      },
      items: {
        connect: itemIds.map((itemId) => ({ id: itemId })),
      },
      metodo_pagamento,
      vat_number,
    },
    include: {
      items: true,
    },
  });

const update = (id: string, preco_total: number, itemIds: string[]) =>
  prisma.factura.update({
    where: { id },
    data: {
      preco_total,
      items: {
        connect: itemIds.map((itemId) => ({ id: itemId })),
      },
    },

    include: {
      items: true,
    },
  });

const remove = (id: string) =>
  prisma.factura.update({
    where: { id },
    data: {
      deleted: true,
    },
  });

export { all, detail, add, update, remove };
