#require YOUR_PROVIDER_API

%w{ assembla ticket project comment }.each do |f|
  require File.dirname(__FILE__) + '/provider/' + f + '.rb';
end
