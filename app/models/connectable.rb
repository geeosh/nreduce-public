module Connectable
	  # Relationships this entity as requested with others
    # not cached
  def requested_relationships
    Relationship.all_requested_relationships_for(self)
  end

    # relationships that other entities have requested with this entity
    # not cached
  def pending_relationships
    Relationship.all_pending_relationships_for(self)
  end

    # Returns true if this entity is connected in an approved relationship
    # uses cache
  def connected_to?(entity)
    self.connected_to_id?(entity.id, entity.class.to_s)
  end

  	# If you don't have the object, you can pass the id and class string to see if these two are connected
  def connected_to_id?(entity_id, entity_class_string)
    ids = Relationship.all_connection_ids_for(self)
    return ids[entity_class_string].include?(entity_id) if !ids.blank? and !ids[entity_class_string].blank?
    return false
  end

    # Returns true if these two starts are connected, or if the provided startup requested to be connected to this startup
    # not cached
  def connected_or_pending_to?(entity)
    # check reverse direction because we need to see if pending request is coming from other startup
    r = Relationship.between(entity, self)
    return true if r and (r.pending? or r.approved?)
    false
  end

  def start_relationship_with(connect_with)
  	Relationship.start_between(self, connect_with)
  end

  def relationship_with(connected_with)
  	Relationship.between(self, connected_with)
  end

  def connectable?
  	true
  end
end