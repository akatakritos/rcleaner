
clean :cwd do
  move "*.txt", :to => "txt-files"
  copy "*.pdf", to: 'documents'
  delete "*.html"
  delete :empty_folders
end

clean '~/Downloads' do
end



