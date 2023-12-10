/*
  Warnings:

  - You are about to drop the column `check_in` on the `hotel` table. All the data in the column will be lost.
  - You are about to drop the column `check_out` on the `hotel` table. All the data in the column will be lost.
  - Added the required column `checkIn` to the `hotel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `checkOut` to the `hotel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "hotel" DROP COLUMN "check_in",
DROP COLUMN "check_out",
ADD COLUMN     "checkIn" TEXT NOT NULL,
ADD COLUMN     "checkOut" TEXT NOT NULL;
