import express, { Request, Response } from "express";
import automoveisRoutes from "./automoveis";
import facturasRoutes from "./facturas";
import itemsRoutes from "./items";
import authRoutes from "./auth";
import { name, version } from "../../package.json";

const router = express.Router();

router.get("/", (req: Request, res: Response) =>
  res.json({
    name,
    version,
  })
);

router.use("/auth", authRoutes);
router.use("/items", itemsRoutes);
router.use("/facturas", facturasRoutes);
router.use("/automoveis", automoveisRoutes);

export default router;
