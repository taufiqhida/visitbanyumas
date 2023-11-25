/*
  Warnings:

  - Added the required column `slug` to the `hotels` table without a default value. This is not possible if the table is not empty.
  - Added the required column `slug` to the `kecamatans` table without a default value. This is not possible if the table is not empty.
  - Added the required column `slug` to the `wisatas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "hotels" ADD COLUMN     "slug" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "kecamatans" ADD COLUMN     "slug" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "wisatas" ADD COLUMN     "slug" TEXT NOT NULL;
