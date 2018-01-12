Post.delete_all
Post.create(:title => 'Title 1',
    :content => 
    %{
        Content title 1.
    })
  
Post.create(:title => 'Title 2',
    :content =>
    %{
        Content title 2.
        Content title 2.
    })
Post.create(:title => 'Title 3',
    :content =>
    %{
        Content title 3.
        Content title 3.
        Content title 3.
    })