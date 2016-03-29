require 'spec_helper'

describe 'windirstat::default' do
  context 'with defaults' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new.converge(described_recipe)
    end
    it 'installs windirstat package' do
      expect(chef_run).to install_windows_package 'WinDirStat 1.1.2'
    end
  end
  context 'with install path' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['windirstat']['home'] = 'C:\\\\WinDirStat_test'
      end.converge(described_recipe)
    end
    it 'installs windirstat package' do
      expect(chef_run).to install_windows_package 'WinDirStat 1.1.2'
    end
  end
end
