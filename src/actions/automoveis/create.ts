import { Request, Response } from "express";
import { add } from "../../services/automoveis";

export default async (request: Request, response: Response) => {
  const { matricula, marca, modelo, cor, observacoes } = request.body;

  const novoAutomovel = await add(matricula, marca, modelo, cor, observacoes);

  return response.json(novoAutomovel);
};
