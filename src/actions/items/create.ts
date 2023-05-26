import { Request, Response } from "express";
import { add } from "../../services/items";

export default async (request: Request, response: Response) => {
  const { nome, preco } = request.body;

  const novoItem = await add(nome, preco);

  return response.json(novoItem);
};
