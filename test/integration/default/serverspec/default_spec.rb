require 'spec_helper'

describe package('WinDirStat 1.1.2') do
  it 'is installed' do
    expect(subject).to be_installed
  end
end

describe file('C:\windirstat') do
  it 'is a directory' do
    expect(subject).to be_directory
  end
end
