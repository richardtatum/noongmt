/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("7fxfvwxy2cus9ez")

  collection.listRule = "@collection.posts.live_date <= @now"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("7fxfvwxy2cus9ez")

  collection.listRule = "@collection.posts.live_date > @now"

  return dao.saveCollection(collection)
})
