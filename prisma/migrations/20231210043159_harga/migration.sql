/*
  Warnings:

  - You are about to drop the column `harga_max` on the `hotel` table. All the data in the column will be lost.
  - You are about to drop the column `harga_min` on the `hotel` table. All the data in the column will be lost.
  - You are about to drop the column `harga_max` on the `wisata` table. All the data in the column will be lost.
  - You are about to drop the column `harga_min` on the `wisata` table. All the data in the column will be lost.
  - Added the required column `hargaMax` to the `hotel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hargaMin` to the `hotel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hargaMax` to the `wisata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hargaMin` to the `wisata` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "hotel" DROP COLUMN "harga_max",
DROP COLUMN "harga_min",
ADD COLUMN     "hargaMax" BIGINT NOT NULL,
ADD COLUMN     "hargaMin" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "wisata" DROP COLUMN "harga_max",
DROP COLUMN "harga_min",
ADD COLUMN     "hargaMax" BIGINT NOT NULL,
ADD COLUMN     "hargaMin" BIGINT NOT NULL;
