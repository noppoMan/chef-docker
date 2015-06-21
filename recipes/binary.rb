bash Docker::Helpers.executable(node) do
  install_dir = node['docker']['install_dir']
  binurl = node['docker']['binary']['url']
  version = node['docker']['binary']['version']

  user 'root'
  code <<-EOC
    echo `id`
    if [ ! -f #{install_dir}/docker ]; then
      cd #{install_dir} && curl -sSL -O #{binurl} && chmod +x docker-#{version} && sudo mv docker-#{version} #{install_dir}/docker
    fi
  EOC
end
