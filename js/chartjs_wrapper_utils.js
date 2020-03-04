window.chartJSWrapperPlugin = class {
  chartJSObject = null;

  checkContext = async (element, selector) => {
    while (element.querySelector(selector) === null) {
      await new Promise(resolve => setTimeout(resolve, 500));
    }
  
    return element.querySelector(selector);
  };

  createGradient = (gradientJson, chartContext) => {
    if (gradientJson.isGradient) {
      var gradient = chartContext.createLinearGradient(0, 0, 0, 400);
  
      for (let i = 0; i < gradientJson.gradient.length; i++) {
        const g = gradientJson.gradient[i];
        gradient.addColorStop(g.stop, g.color);
      }
  
      return gradient;
    }
    return gradientJson;
  }

  showChart = (chartId, config, formatTooltip) => {
    config = JSON.parse(config);

    var tooltipCallback = {
      callbacks: {
        label: formatTooltip
      }
    }

    if(formatTooltip) {
      if(!config.options) {
        config['options'] = {
          tooltips: tooltipCallback
        }
      }

      if(!config.options.tooltips) {
        config.options['tooltips'] = tooltipCallback;
      }
    }
  
    this.checkContext(document, "flt-platform-view").then(platformView => {
        this.checkContext(platformView.shadowRoot, "#" + chartId).then(chart => {
          var _chartContext = chart.getContext("2d");
    
          config.data.datasets.forEach(element => {
            if (element.backgroundColor) {
              element.backgroundColor = createGradient(
                element.backgroundColor,
                _chartContext
              );
            }
    
            if (element.borderColor) {
              element.borderColor = createGradient(
                element.borderColor,
                chartContext
              );
            }
          });
    
          if (config.options) {
            if (config.options.scales) {
              if (config.options.scales.xAxes) {
                config.options.scales.xAxes.forEach(element => {
                  if (element.ticks) {
                    if (element.ticks.format) {
                      element.ticks.callback = function(value, index, values) {
                        return element.ticks.format.replace("{value}", value);
                      };
                    }
                  }
                });
              }
    
              if (config.options.scales.yAxes) {
                config.options.scales.yAxes.forEach(element => {
                  if (element.ticks) {
                    if (element.ticks.format) {
                      element.ticks.callback = function(value, index, values) {
                        return element.ticks.format.replace("{value}", value);
                      };
                    }
                  }
                });
              }
            }
          }
          if (this.chartJSObject != null) chartJSObject.destroy();
    
          this.chartJSObject = new Chart(_chartContext, config);
      })
    });
  }
  
}