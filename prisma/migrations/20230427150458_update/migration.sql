/*
  Warnings:

  - You are about to drop the column `data_e_hora` on the `Factura` table. All the data in the column will be lost.
  - You are about to drop the `_FacturaToItem_Reparacao` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_FacturaToItem_Reparacao` DROP FOREIGN KEY `_FacturaToItem_Reparacao_A_fkey`;

-- DropForeignKey
ALTER TABLE `_FacturaToItem_Reparacao` DROP FOREIGN KEY `_FacturaToItem_Reparacao_B_fkey`;

-- AlterTable
ALTER TABLE `Factura` DROP COLUMN `data_e_hora`;

-- DropTable
DROP TABLE `_FacturaToItem_Reparacao`;

-- CreateTable
CREATE TABLE `_RelationTable` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_RelationTable_AB_unique`(`A`, `B`),
    INDEX `_RelationTable_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_RelationTable` ADD CONSTRAINT `_RelationTable_A_fkey` FOREIGN KEY (`A`) REFERENCES `Factura`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_RelationTable` ADD CONSTRAINT `_RelationTable_B_fkey` FOREIGN KEY (`B`) REFERENCES `Item_Reparacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
