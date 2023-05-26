import { Request, Response } from "express";
import { update, detail } from "../../services/facturas";

export default async (request: Request, response: Response) => {
  const { id } = request.params;
  const { preco_total, itemIds } = request.body;

  if (!(await detail(id))) {
    return response.status(404).json({
      code: 404,
      message: "Factura não encontrada",
    });
  }

  try {
    const factura = await update(id, preco_total, itemIds);
    return response.json(factura);
  } catch (error) {
    console.error(error);
    return response.status(500).json({
      code: 500,
      message: "Erro ao atualizar factura",
    });
  }
};
