class Monk < Thor
  include Thor::Actions

  desc "spec", "Run all specs"
  def spec
    spec_root = File.join(File.dirname(__FILE__), 'spec')
    spec_files = Dir[File.join(spec_root, '**', '*spec.rb')].map{ |f| File.expand_path(f) }.join(' ')
    spec_opts = "-f p -c -b -p"
    puts `rspec #{spec_opts} #{spec_files}`
  end

  desc "start ENV", "Start Monk in the supplied environment"
  def start(env = ENV["RACK_ENV"] || "development")
    verify_config(env)

    exec "env RACK_ENV=#{env} ruby init.rb"
  end

  desc "copy_example EXAMPLE, TARGET", "Copies an example file to its destination"
  def copy_example(example, target = target_file_for(example))
    File.exists?(target) ? return : say_status(:missing, target)
    File.exists?(example) ? copy_file(example, target) : say_status(:missing, example)
  end

private

  def self.source_root
    File.dirname(__FILE__)
  end

  def target_file_for(example_file)
    example_file.sub(".example", "")
  end

  def verify_config(env)
    verify "config/settings.example.yml"
  end

  def verify(example)
    copy_example(example) unless File.exists?(target_file_for(example))
  end

end
