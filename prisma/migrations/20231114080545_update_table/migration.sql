/*
  Warnings:

  - You are about to drop the column `idFasilitas` on the `hotels` table. All the data in the column will be lost.
  - You are about to drop the column `idFasilitas` on the `wisatas` table. All the data in the column will be lost.
  - You are about to drop the column `idImage` on the `wisatas` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "hotels" DROP COLUMN "idFasilitas";

-- AlterTable
ALTER TABLE "wisatas" DROP COLUMN "idFasilitas",
DROP COLUMN "idImage";
