# coding: utf-8
module My::PostsHelper
  def select_category
    [
      ['カテゴリが選択されていません。', ''],
      *Category.all.map {|cat| [cat.kind, cat.id] }
    ]
  end
end
