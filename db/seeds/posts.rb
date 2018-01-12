Post.delete_all
10.times do
     Post.create(
        title: FFaker::Book.title,
        content: FFaker::Book.description
      ) 
end