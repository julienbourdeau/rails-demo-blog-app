class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  after_initialize do |model|
    DevTools::Acc.model(model.class.name)
  end
end
