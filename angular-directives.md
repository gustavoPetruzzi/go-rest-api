# Angular Directives - Advanced Patterns

## 1. Host Binding & Host Listener

```typescript
@Directive({ selector: '[appHighlight]' })
export class HighlightDirective {
  @HostBinding('style.backgroundColor') bgColor = 'yellow';
  
  @HostListener('click') onClick() {
    console.log('host clicked');
  }
}
```

## 2. Directive Composition (Layered Directives)

Extend existing directives instead of rewriting:

```typescript
@Directive({ selector: '[appTooltipDelay]' })
export class TooltipDelayDirective extends TooltipDirective {
  @Input() delay = 500;
  
  @HostListener('mouseenter') onMouseEnter() {
    setTimeout(() => super.onMouseEnter(), this.delay);
  }
}
```

## 3. Directive Controllers

Encapsulate complex logic using TemplateRef and ViewContainerRef:

```typescript
@Directive({ selector: '[appModal]' })
export class ModalDirective {
  isOpen = false;
  
  constructor(
    private templateRef: TemplateRef<any>,
    private viewContainer: ViewContainerRef
  ) {}
  
  open() {
    this.viewContainer.createEmbeddedView(this.templateRef);
    this.isOpen = true;
  }
  
  close() {
    this.viewContainer.clear();
    this.isOpen = false;
  }
}
```

## 4. Dependency Injection in Directives

Inject services directly into directives:

```typescript
@Directive({ selector: '[appLogger]' })
export class LoggerDirective {
  constructor(private logger: LoggerService) {}
}
```

## 5. Control Flow Directive (@if, @for)

New Angular 17+ syntax - these ARE directives under the hood:

```html
@if (user.isLoggedIn) {
  <span>Welcome {{ user.name }}</span>
}
@for (let item of items; track item.id) {
  <li>{{ item.name }}</li>
}
```

## Key Best Practices

- Keep directives lean - avoid business logic, stick to DOM-related tasks
- Use descriptive selectors (prefix with app or custom namespace)
- Validate @Input() using ngOnChanges
- Combine with Angular's new control-flow syntax
- Use ElementRef sparingly - prefer @HostBinding for styling

## Sources

- Medium: Angular Directives 2025 Edition
- Bitsrc.io: Understanding Advanced Angular Directives
- TheLinuxCode: Complete Guide to Custom Directives
- DEV Community Interview Questions