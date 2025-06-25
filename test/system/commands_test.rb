require "application_system_test_case"

class CommandsTest < ApplicationSystemTestCase
  setup do
    @command = commands(:one)
  end

  test "visiting the index" do
    visit commands_url
    assert_selector "h1", text: "Commands"
  end

  test "should create command" do
    visit commands_url
    click_on "New command"

    fill_in "Device", with: @command.Device_id
    fill_in "Command", with: @command.command
    fill_in "Result", with: @command.result
    fill_in "Trigger time", with: @command.trigger_time
    fill_in "Type", with: @command.type
    click_on "Create Command"

    assert_text "Command was successfully created"
    click_on "Back"
  end

  test "should update Command" do
    visit command_url(@command)
    click_on "Edit this command", match: :first

    fill_in "Device", with: @command.Device_id
    fill_in "Command", with: @command.command
    fill_in "Result", with: @command.result
    fill_in "Trigger time", with: @command.trigger_time.to_s
    fill_in "Type", with: @command.type
    click_on "Update Command"

    assert_text "Command was successfully updated"
    click_on "Back"
  end

  test "should destroy Command" do
    visit command_url(@command)
    click_on "Destroy this command", match: :first

    assert_text "Command was successfully destroyed"
  end
end
