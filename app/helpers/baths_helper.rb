module BathsHelper

  # 送信ボタン文字列切り替え用
  def button_text
    if    action_name == "new"
      (t"helpers.submit.create")
    elsif action_name == "edit"
      (t"helpers.submit.update")
    end
  end
end
