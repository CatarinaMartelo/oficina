import { Request, Response } from "express";
import { remove, detail } from "../../services/facturas";

export default async (request: Request, response: Response) => {
  const { id } = request.params;

  if (!(await detail(id))) {
    return response.status(404).json({
      code: 404,
      message: "Factura não encontrada",
    });
  }

  await remove(id);
  return response.status(200).json({
    code: 200,
    message: "Factura eliminada com sucesso",
  });
};
