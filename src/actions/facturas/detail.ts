import { Request, Response } from "express";
import { detail } from "../../services/facturas";

export default async (request: Request, response: Response) => {
  const { id } = request.params;

  const factura = await detail(id);

  if (!factura) {
    return response.status(404).json({
      code: 404,
      message: "Factura não encontrada",
    });
  }

  return response.json(factura);
};
