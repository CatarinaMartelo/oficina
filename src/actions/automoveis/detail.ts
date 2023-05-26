import { Request, Response } from "express";
import { detail } from "../../services/automoveis";

export default async (request: Request, response: Response) => {
  const { id } = request.params;

  const automovel = await detail(id);

  if (!automovel) {
    return response.status(404).json({
      code: 404,
      message: "Automóvel não encontrado",
    });
  }

  return response.json(automovel);
};
