# frozen_string_literal: true

# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.

if Rails.env.development? || Rails.env.test?
  require 'annotate'

  task set_annotation_options: :environment do

    # You can override any of these by setting an environment variable of the
    # same name.
    Annotate.set_defaults(
      'exclude_factories'           => 'true',
      'exclude_fixtures'            => 'true',
      'exclude_scaffolds'           => 'true',
      'exclude_serializers'         => 'true',
      'exclude_tests'               => 'true',
      'force'                       => 'false',
      'format_bare'                 => 'true',
      'format_markdown'             => 'false',
      'format_rdoc'                 => 'false',
      'ignore_model_sub_dir'        => 'false',
      'include_version'             => 'false',
      'model_dir'                   => 'app/models',
      'models'                      => 'true',
      'position_in_class'           => 'after',
      'position_in_factory'         => 'after',
      'position_in_fixture'         => 'after',
      'position_in_routes'          => 'after',
      'position_in_test'            => 'after',
      'require'                     => '',
      'show_indexes'                => 'true',
      'simple_indexes'              => 'true',
      'skip_on_db_migrate'          => 'false',
      'sort'                        => 'false',
      'trace'                       => 'false'
    )
  end

  Annotate.load_tasks
end
