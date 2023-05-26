/*
  Warnings:

  - The primary key for the `Automovel` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Factura` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `item_reparacaoId` on the `Factura` table. All the data in the column will be lost.
  - The primary key for the `Item_Reparacao` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE `Factura` DROP FOREIGN KEY `Factura_automovelId_fkey`;

-- DropForeignKey
ALTER TABLE `Factura` DROP FOREIGN KEY `Factura_item_reparacaoId_fkey`;

-- AlterTable
ALTER TABLE `Automovel` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Factura` DROP PRIMARY KEY,
    DROP COLUMN `item_reparacaoId`,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `automovelId` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Item_Reparacao` DROP PRIMARY KEY,
    ADD COLUMN `facturaId` VARCHAR(191) NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `Factura` ADD CONSTRAINT `Factura_automovelId_fkey` FOREIGN KEY (`automovelId`) REFERENCES `Automovel`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Item_Reparacao` ADD CONSTRAINT `Item_Reparacao_facturaId_fkey` FOREIGN KEY (`facturaId`) REFERENCES `Factura`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
