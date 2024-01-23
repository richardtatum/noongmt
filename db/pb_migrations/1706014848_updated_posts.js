/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("7fxfvwxy2cus9ez")

  collection.indexes = [
    "CREATE UNIQUE INDEX `idx_6s8sA0U` ON `posts` (`live_date`)"
  ]

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("7fxfvwxy2cus9ez")

  collection.indexes = []

  return dao.saveCollection(collection)
})
