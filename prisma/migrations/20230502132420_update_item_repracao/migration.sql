/*
  Warnings:

  - A unique constraint covering the columns `[nome]` on the table `Item_Reparacao` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Item_Reparacao_nome_key` ON `Item_Reparacao`(`nome`);
