class SiteCrawl < ApplicationRecord
  # include PgSearch
  #
  # pg_search_scope :search, against: [:address, :title_1, :meta_description_1, :h1_1]

  filterrific :default_filter_params => { :sorted_by => 'address_desc' },
              :available_filters => %w[
                sorted_by
                search_query
              ]

  # default for will_paginate
  #self.per_page = 10
# define ActiveRecord scopes for
# :search_query, :sorted_by

# Scope definitions. We implement all Filterrific filters through ActiveRecord
# scopes. In this example we omit the implementation of the scopes for brevity.
# Please see 'Scope patterns' for scope implementation details.
scope :search_query, lambda { |query|
  # Filters students whose name or email matches the query
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(site_crawls.address) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
}
scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^address_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("site_crawls.address #{ direction }")
  when /^site_id_/
    # Simple sort on the name colums
    order("site_crawls.site_id #{ direction }")
  when /^id_/
    # This sorts by a student's country name, so we need to include
    # the country. We can't use JOIN since not all students might have
    # a country.
    order("site_crawls.id #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}

# This method provides select options for the `sorted_by` filter select input.
# It is called in the controller as part of `initialize_filterrific`.
# def self.options_for_sorted_by
#   [
#     ['Address', 'address_asc'],
#     ['ID', 'id_desc'],
#   ]
# end

end
