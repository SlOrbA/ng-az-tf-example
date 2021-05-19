import { Component } from '@angular/core';
import { ApplicationInsights } from '@microsoft/applicationinsights-web';
import { AngularPlugin } from '@microsoft/applicationinsights-angularplugin-js';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'example-app';
  constructor(private router: Router)
  {
    var angularPlugin = new AngularPlugin();
    const appInsights = new ApplicationInsights({ config: {
    instrumentationKey: 'YOUR_INSTRUMENTATION_KEY_GOES_HERE',
    extensions: [angularPlugin],
    extensionConfig: {
        [angularPlugin.identifier]: { router: this.router }
    }
    } });
    appInsights.loadAppInsights();
}
}
