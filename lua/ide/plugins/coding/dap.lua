return {
  "mfussenegger/nvim-dap",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Mason integration for DAP servers
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "williamboman/mason.nvim" },
      cmd = { "DapInstall", "DapUninstall" },
      config = function()
        require("mason-nvim-dap").setup({
          ensure_installed = {
            "python", -- Python debugger
            "node2", -- Node.js/JavaScript debugger
            "delve", -- Go debugger
          },
          automatic_installation = true,
          handlers = {
            -- Default handler for all adapters
            function(config)
              require("mason-nvim-dap").default_setup(config)
            end,
            -- Custom handler for Python
            python = function(config)
              config.adapters = {
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
              }
              require("mason-nvim-dap").default_setup(config)
            end,
          },
        })
      end,
    },

    -- Debug UI
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup dapui with clean configuration
        dapui.setup({
          icons = { expanded = "", collapsed = "", current_frame = "" },
          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 40,
              position = "left",
            },
            {
              elements = { "repl", "console" },
              size = 0.25,
              position = "bottom",
            },
          },
        })

        -- Auto open/close dapui when debugging starts/stops
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      end,
    },

    -- Virtual text for inline variable display
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup({
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          highlight_new_as_changed = false,
          show_stop_reason = true,
          commented = false,
          only_first_definition = true,
          all_references = false,
          clear_on_continue = false,
          display_callback = function(variable, buf, stackframe, node, options)
            if options.virt_text_pos == "inline" then
              return " = " .. variable.value
            else
              return variable.name .. " = " .. variable.value
            end
          end,
        })
      end,
    },

    -- Telescope integration (if telescope is enabled)
    {
      "nvim-telescope/telescope-dap.nvim",
      config = function()
        local config = require("ide.config")
        local features = config.features or {}
        if features.telescope ~= false then
          require("telescope").load_extension("dap")
        end
      end,
    },
  },
  config = function()
    local dap = require("dap")

    -- Setup breakpoint signs with modern icons
    vim.fn.sign_define("DapBreakpoint", {
      text = "●",
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "◐",
      texthl = "DapBreakpointCondition",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "◆",
      texthl = "DapLogPoint",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapStopped", {
      text = "→",
      texthl = "DapStopped",
      linehl = "DapStoppedLine",
      numhl = "",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "●",
      texthl = "DapBreakpointRejected",
      linehl = "",
      numhl = "",
    })

    -- Additional manual configuration for common languages if needed
    -- Mason handles most of this automatically, but manual configs can override

    -- Python configuration (fallback if Mason doesn't handle it)
    if not dap.adapters.python then
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            -- Try to find python in various locations
            local paths = { "/usr/bin/python3", "/usr/bin/python", "python3", "python" }
            for _, path in ipairs(paths) do
              if vim.fn.executable(path) == 1 then
                return path
              end
            end
            return "python"
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Launch file with arguments",
          program = "${file}",
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
          end,
          pythonPath = function()
            local paths = { "/usr/bin/python3", "/usr/bin/python", "python3", "python" }
            for _, path in ipairs(paths) do
              if vim.fn.executable(path) == 1 then
                return path
              end
            end
            return "python"
          end,
        },
      }
    end
  end,
}
