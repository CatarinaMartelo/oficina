import { Request, Response } from "express";
import { add } from "../../services/facturas";

export default async (request: Request, response: Response) => {
  const {
    numero_ft,
    preco_total,
    automovelId,
    items,
    metodo_pagamento,
    vat_number,
  } = request.body;

  try {
    const novaFactura = await add(
      numero_ft,
      preco_total,
      automovelId,
      items,
      metodo_pagamento,
      vat_number
    );
    console.log("Created new invoice:", novaFactura);
    return response.json(novaFactura);
  } catch (error) {
    console.log("Failed to create invoice:", error);
    return response.status(500).json({ message: "Failed to create invoice" });
  }
};
