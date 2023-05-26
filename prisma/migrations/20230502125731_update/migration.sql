/*
  Warnings:

  - You are about to drop the `_AutomovelToFactura` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_RelationTable` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_AutomovelToFactura` DROP FOREIGN KEY `_AutomovelToFactura_A_fkey`;

-- DropForeignKey
ALTER TABLE `_AutomovelToFactura` DROP FOREIGN KEY `_AutomovelToFactura_B_fkey`;

-- DropForeignKey
ALTER TABLE `_RelationTable` DROP FOREIGN KEY `_RelationTable_A_fkey`;

-- DropForeignKey
ALTER TABLE `_RelationTable` DROP FOREIGN KEY `_RelationTable_B_fkey`;

-- DropIndex
DROP INDEX `Factura_automovelId_key` ON `Factura`;

-- DropTable
DROP TABLE `_AutomovelToFactura`;

-- DropTable
DROP TABLE `_RelationTable`;

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
