/*
  Warnings:

  - You are about to drop the `Follower` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Following` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Follower";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Following";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Followerdbs" (
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "followingid" INTEGER NOT NULL,
    "followerid" INTEGER NOT NULL,

    PRIMARY KEY ("followingid", "followerid"),
    CONSTRAINT "Followerdbs_followerid_fkey" FOREIGN KEY ("followerid") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Followerdbs_followingid_fkey" FOREIGN KEY ("followingid") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
