resource "google_document_ai_warehouse_document_schema" "example_enum" {
  project_number = data.google_project.project.number
  display_name   = "test-property-enum"
  location       = "us"

  property_definitions {
    name                 = "prop6"
    display_name         = "propdisp6"
    is_repeatable        = false
    is_filterable        = true
    is_searchable        = true
    is_metadata          = false
    is_required          = false
    retrieval_importance = "HIGHEST"
    schema_sources {
      name           = "dummy_source"
      processor_type = "dummy_processor"
    }
    enum_type_options {
      possible_values = [
        "M",
        "F",
        "X"
      ]
      validation_check_disabled = false
    }
  }
}

data "google_project" "project" {
}
