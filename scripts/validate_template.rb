require "yaml"

template_path = File.expand_path("../switch/content-studio.template.yaml", __dir__)
template = YAML.load_file(template_path)

required_keys = %w[agents room kickoff]
missing_keys = required_keys.reject { |key| template.key?(key) }
abort "Missing template keys: #{missing_keys.join(", ")}" unless missing_keys.empty?

agents = template.fetch("agents")
abort "Expected exactly 3 agents" unless agents.length == 3

expected_names = %w[{team}-research {team}-script {team}-review]
actual_names = agents.map { |agent| agent.fetch("name") }
abort "Unexpected agent names: #{actual_names.join(", ")}" unless actual_names == expected_names

room_agents = template.fetch("room").fetch("agents")
abort "Room must reference exactly the three declared agents" unless room_agents == actual_names

valid_addressing = %w[owner owner-agents anyone]
agents.each do |agent|
  abort "#{agent["name"]}: missing provider" unless agent["provider"]
  abort "#{agent["name"]}: missing instructions" if agent["instructions"].to_s.strip.empty?
  abort "#{agent["name"]}: invalid addressing" unless valid_addressing.include?(agent["addressing"])
end

puts "Content Studio template: valid"
