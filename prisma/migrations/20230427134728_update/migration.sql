/*
  Warnings:

  - You are about to drop the column `facturaId` on the `Item_Reparacao` table. All the data in the column will be lost.
  - Made the column `automovelId` on table `Factura` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `Factura` DROP FOREIGN KEY `Factura_automovelId_fkey`;

-- DropForeignKey
ALTER TABLE `Item_Reparacao` DROP FOREIGN KEY `Item_Reparacao_facturaId_fkey`;

-- AlterTable
ALTER TABLE `Factura` MODIFY `automovelId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Item_Reparacao` DROP COLUMN `facturaId`;

-- CreateTable
CREATE TABLE `_FacturaToItem_Reparacao` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_FacturaToItem_Reparacao_AB_unique`(`A`, `B`),
    INDEX `_FacturaToItem_Reparacao_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Factura` ADD CONSTRAINT `Factura_automovelId_fkey` FOREIGN KEY (`automovelId`) REFERENCES `Automovel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FacturaToItem_Reparacao` ADD CONSTRAINT `_FacturaToItem_Reparacao_A_fkey` FOREIGN KEY (`A`) REFERENCES `Factura`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FacturaToItem_Reparacao` ADD CONSTRAINT `_FacturaToItem_Reparacao_B_fkey` FOREIGN KEY (`B`) REFERENCES `Item_Reparacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
