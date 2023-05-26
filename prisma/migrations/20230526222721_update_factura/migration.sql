/*
  Warnings:

  - Added the required column `metodo_pagamento` to the `Factura` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Factura` ADD COLUMN `metodo_pagamento` VARCHAR(191) NOT NULL,
    ADD COLUMN `vat_number` VARCHAR(191) NULL;
