/*
  Warnings:

  - The primary key for the `Followerdbs` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `id` to the `Followerdbs` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Followerdbs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "followingid" INTEGER,
    "followerid" INTEGER,
    CONSTRAINT "Followerdbs_followerid_fkey" FOREIGN KEY ("followerid") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Followerdbs_followingid_fkey" FOREIGN KEY ("followingid") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Followerdbs" ("createdAt", "followerid", "followingid") SELECT "createdAt", "followerid", "followingid" FROM "Followerdbs";
DROP TABLE "Followerdbs";
ALTER TABLE "new_Followerdbs" RENAME TO "Followerdbs";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
