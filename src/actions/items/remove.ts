import { Request, Response } from "express";
import { remove, detail } from "../../services/items";

export default async (request: Request, response: Response) => {
  const { id } = request.params;

  if (!(await detail(id))) {
    return response.status(404).json({
      code: 404,
      message: "Item de reparação não encontrado",
    });
  }

  await remove(id);
  return response.status(200).json({
    code: 200,
    message: "Item de reparação eliminado com sucesso",
  });
};
