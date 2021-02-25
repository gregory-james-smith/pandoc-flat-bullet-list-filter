
-- Default separators for each supported format
local latex_separator = pandoc.RawInline("latex", " \\enspace $\\bullet$ \\enspace ")
local html_separator = pandoc.RawInline("html", " &bull; ")
local default_separators = {latex = latex_separator, html = html_separator}

-- Make list of supported formats from those formats with default separators
local supported_formats = {}
for k,_ in pairs(default_separators) do
    table.insert(supported_formats, k)
end

-- Name of the div class which indicates it should be a flat bullet list
local class_name = "flat-bullet-list"

function Div(elem)
    if not is_supported_format() then
        print("Format " .. FORMAT .. " is not supported.")
        return elem
    end
    local contents = get_bullet_list_div_contents(elem)
    if contents then
        local text = {}
        for i,j in ipairs(contents) do
            local section = j[1]
            if i ~= 1 then
                table.insert(text, default_separators[FORMAT])
            end
            table.insert(text, pandoc.Str(pandoc.utils.stringify(section)))
        end
        local paragraph = pandoc.Para(text)
        -- Modify div content but keep other attributes
        elem.content = {paragraph}
        return elem
    end
    return elem
end

-- Return true if the input format is supported
function is_supported_format()
    for _,i in pairs(supported_formats) do
        if i == FORMAT then
            return true
        end
    end
    return false
end

-- Returns the contents of BulletList inside Div with configured class tag, otherwise returns nil
function get_bullet_list_div_contents(elem)
    if is_bullet_list_class(elem) then
        local content = elem.content[1]
        if content.tag == "BulletList" then
            return content.content
        end
    end
    return nil
end

-- Return true iff div has the configured class tag
function is_bullet_list_class(elem)
    local classes = elem.classes
    for _,i in pairs(classes) do
        if i == class_name then
            return true
        end
    end
    return false
end
