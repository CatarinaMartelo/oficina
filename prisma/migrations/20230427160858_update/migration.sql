/*
  Warnings:

  - A unique constraint covering the columns `[numero_ft]` on the table `Factura` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Factura_numero_ft_key` ON `Factura`(`numero_ft`);
