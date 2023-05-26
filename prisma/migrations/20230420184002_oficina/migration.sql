-- CreateTable
CREATE TABLE `Automovel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `matricula` VARCHAR(255) NOT NULL,
    `marca` VARCHAR(255) NOT NULL,
    `modelo` VARCHAR(255) NOT NULL,
    `cor` VARCHAR(255) NOT NULL,
    `observacoes` TEXT NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Factura` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `numero_ft` INTEGER NOT NULL,
    `data_e_hora` DATETIME(3) NOT NULL,
    `item_reparacaoId` INTEGER NOT NULL,
    `preco_total` INTEGER NOT NULL,
    `automovelId` INTEGER NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `Factura_item_reparacaoId_key`(`item_reparacaoId`),
    UNIQUE INDEX `Factura_automovelId_key`(`automovelId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Item_Reparacao` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `preco` INTEGER NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Factura` ADD CONSTRAINT `Factura_item_reparacaoId_fkey` FOREIGN KEY (`item_reparacaoId`) REFERENCES `Item_Reparacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Factura` ADD CONSTRAINT `Factura_automovelId_fkey` FOREIGN KEY (`automovelId`) REFERENCES `Automovel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
