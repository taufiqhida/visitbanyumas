/*
  Warnings:

  - A unique constraint covering the columns `[idImagekit]` on the table `images` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idImagekit` to the `images` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `images` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "images" ADD COLUMN     "idImagekit" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "images_idImagekit_key" ON "images"("idImagekit");
