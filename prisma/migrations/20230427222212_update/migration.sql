-- DropForeignKey
ALTER TABLE `Factura` DROP FOREIGN KEY `Factura_automovelId_fkey`;

-- CreateTable
CREATE TABLE `_AutomovelToFactura` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_AutomovelToFactura_AB_unique`(`A`, `B`),
    INDEX `_AutomovelToFactura_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_AutomovelToFactura` ADD CONSTRAINT `_AutomovelToFactura_A_fkey` FOREIGN KEY (`A`) REFERENCES `Automovel`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AutomovelToFactura` ADD CONSTRAINT `_AutomovelToFactura_B_fkey` FOREIGN KEY (`B`) REFERENCES `Factura`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
