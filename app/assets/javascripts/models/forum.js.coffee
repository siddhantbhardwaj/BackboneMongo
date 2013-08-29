class BackboneMongo.Models.Forum extends Backbone.RelationalModel
  idAttribute: "_id"
  urlRoot: "/forums"
  
  relations: [
    type: Backbone.HasMany
    key: 'comments'
    relatedModel: 'BackboneMongo.Models.Comment'
    collectionType: 'BackboneMongo.Collections.Comments'
    reverseRelation:
      key: 'forum_id',
      includeInJSON: 'id'
  ]
    