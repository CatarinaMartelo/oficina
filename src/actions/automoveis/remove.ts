import { Request, Response } from "express";
import { remove, detail } from "../../services/automoveis";

export default async (request: Request, response: Response) => {
  const { id } = request.params;

  if (!(await detail(id))) {
    return response.status(404).json({
      code: 404,
      message: "Automóvel não encontrado",
    });
  }

  await remove(id);
  return response.status(200).json({
    code: 200,
    message: "Automóvel eliminado com sucesso",
  });
};
