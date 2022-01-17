# frozen_string_literal: true

def button_exists?(button)
  $logger.info("Checking for the existence of the button #{el} using XPATH")
  $driver.find_elements(:xpath, button).count > 0
end

def wait_for_button_to_exist(button)
  $logger.info("Waited for the existence of the button #{el} using XPATH")
  $wait.until { button_exists? button }
end

def click_button(button)
  wait_for_button_to_exist button
  $driver.find_element(:xpath, '#{button}').click
  $logger.info("Clicked on the button #{button} using XPATH")
end

def wait_for(el)
  case el['type_search']
  when 'XPATH'
    $wait.until { $driver.find_element(:xpath, el['value']).displayed? }
  when 'ID'
    $wait.until { $driver.find_element(:id, el['value']).displayed? }
  when 'CLASS'
    $wait.until { $driver.find_element(:class, el['value']).displayed? }
  end
  $logger.info("Waited for the element to exist #{el['value']} using #{el['type_search']}")
end

def wait_for_element_to_exist(el)
  case el['type_search']
  when 'XPATH'
    $wait.until { element_exists? el['value'] }
  when 'ID'
    $wait.until { element_exists? el['value'] }
  when 'CLASS'
    $wait.until { element_exists? el['value'] }
  end
  $logger.info("Waited for the element to exist #{el['value']} using #{el['type_search']}")
end

def click(el)
  wait_for_element_exist(el)
  case el['type_search']
  when 'XPATH'
    $driver.find_element(:xpath, el['value']).click
  when 'ID'
    $driver.find_element(:id, el['value']).click
  when 'CLASS'
    $driver.find_element(:class, el['value']).click
  end
  $logger.info('Clicked the button ' + el['value'] + ' using ' + el['type_search'])
  sleep(1)
end

def wait_for_element_exist(el)
  case el['type_search']
  when 'XPATH'
    $wait.until {element_exists? el}
  when 'ID'
    $wait.until {element_exists? el}
  when 'CLASS'
    $wait.until {element_exists? el}
  end
  $logger.info("Waited for the element to exist #{el['value']} using #{el['type_search']}")
end


def click_index(el, index)
  wait_for_element_exist(el)
  case el['type_search']
  when 'XPATH'
    $driver.find_elements(:xpath, el['value'])[index].click
  when 'ID'
    $driver.find_elements(:id, el['value'])[index].click
  when 'CLASS'
    $driver.find_elements(:class, el['value'])[index].click
  end
  $logger.info("Clicked on the index #{index} of the element #{el['value']} using #{el['type_search']}")
end

def click_subelement_index(element, el, index)
  wait_for_element_to_exist(el)
  case el['type_search']
  when 'XPATH'
    element.find_elements(:xpath, el['value']).get(index).click
  when 'ID'
    element.find_elements(:id, el['value']).get(index).click
  when 'CLASS'
    element.find_elements(:class, el['value']).get(index).click
  end
  $logger.info("Clicked on a sub-element in the index #{index} of the element #{el['value']} using #{el['type_search']}")
end

def element_exists?(el)
  $logger.info("Checking if the element exists #{el['value']} using #{el['type_search']}")
  case el['type_search']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).count > 0
  when 'ID'
    return $driver.find_elements(:id, el['value']).count > 0
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).count > 0
  end
end

def refresh_screen
  $driver.refresh
end

def back_screen
  $driver.back
end

def elements(el)
  case el['type_search']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value'])
  when 'ID'
    return $driver.find_elements(:id, el['value'])
  when 'CLASS'
    return $driver.find_elements(:class, el['value'])
  end
  $logger.info('Fetched the list of elements ' + el['value'] + ' using ' + el['type_search'])
end

def element_is_enabled?(el)
  $logger.info("Enabled element #{el['value']} using #{el['type_search']}")
  case el['type_search']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).enabled
  when 'ID'
    return $driver.find_elements(:id, el['value']).enabled
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).enabled
  end
end

def get_text(el)
  $logger.info('Is looking for the text of the element ' + el['value'] + ' using ' + el['type_search'])
  case el['type_search']
  when 'XPATH'
    return $driver.find_element(:xpath, el['value']).text
  when 'ID'
    return $driver.find_element(:id, el['value']).text
  when 'CLASS'
    return $driver.find_element(:class, el['value']).text
  end
end

def get_subelement_text_index(element, el, index)
  $logger.info("Searching for text in subelement in the index #{index} of the element #{el['value']} using #{el['type_search']}")
  case el['type_search']
  when 'XPATH'
    return element.find_elements(:xpath, el['value']).get(index).text
  when 'ID'
    return element.find_elements(:id, el['value']).get(index).text
  when 'CLASS'
    return element.find_elements(:class, el['value']).get(index).text
  end
end

def get_text_index(el, index)
  $logger.info("Text index #{index} of the element #{el['value']} using #{el['type_search']}")
  case el['type_search']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).get(index).text
  when 'ID'
    return $driver.find_elements(:id, el['value']).get(index).text
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).get(index).text
  end
end

def fill_in(el, text)
  case el['type_search']
  when 'XPATH'
    element = $driver.find_element(:xpath, el['value'])
  when 'ID'
    element = $driver.find_element(:id, el['value'])
  when 'CLASS'
    element = $driver.find_element(:class, el['value'])
  end
  element.clear
  element.send_keys text
  $logger.info("Filled in the field #{el} using #{el['type_search']} with the value #{text}")
end

def hide_keyboard
  if android?
    $driver.hide_keyboard
  elsif ios?
    $driver.hide_keyboard :pressKey
  end
  $logger.info('Closed the virtual keyboard')
end

def xpath_exists?(xpath)
  $driver.find_elements(:xpath, xpath).count > 0
end

def wait_for_xpath_to_exist(xpath)
  $wait.until { xpath_exists? xpath }
end

def click_xpath(xpath)
  wait_for_xpath_to_exist xpath
  $driver.find_element(:xpath, xpath).click
end

def id_exists?(id)
  $driver.find_elements(:id, id).count > 0
end

def wait_for_id_to_exist(id)
  $wait.until { id_exists? id }
end

def click_id(id)
  wait_for_id_to_exist id
  $driver.find_element(:id, id).click
end

def tap_screen(screen_x, screen_y)
  Appium::TouchAction.new.tap(x: screen_x, y: screen_y).perform
end

def scroll_to(el_start, el_start_location, el_end, el_end_location)
  if el_start_location == 'ID' && el_end_location == 'ID'
    # get element coordinates start
    el_start = $driver.find_element(:id, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:id, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  elsif el_start_location == 'XPATH' && el_end_location == 'XPATH'
    # get element coordinates start
    el_start = $driver.find_element(:xpath, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:xpath, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  elsif el_start_location == 'ID' && el_end_location == 'XPATH'
    # get element coordinates start
    el_start = $driver.find_element(:id, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:xpath, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  elsif el_start_location == 'XPATH' && el_end_location == 'ID'
    # get element coordinates start
    el_start = $driver.find_element(:xpath, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:id, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  end
  Appium::TouchAction.new.swipe(start_x: screen_x_start, start_y: screen_y_start, delta_x: screen_x_end, delta_y: screen_y_end).perform
  $logger.info("Performed scroll to coordinates: screen_x_start #{screen_x_start} - screen_y_start #{screen_y_start} - screen_x_end #{screen_x_end} - screen_y_end #{screen_y_end}")
end

def id_text(id)
  wait_for_id_to_exist id
  $driver.find_element(:id, id).text
end

def text_exists?(text)
  $driver.find_elements(:xpath, "//*[contains(@text,\"#{text}\")]").count > 0
end

def wait_for_text_to_exist(text)
  $wait.until { text_exists? text }
end

def click_text(text)
  wait_for_text_to_exist text
  $driver.find_element(:xpath, "//*[contains(@text,'#{text}')]").click
end

def android?
  $platform == 'android'
end

def ios?
  $platform == 'ios'
end